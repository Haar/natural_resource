require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:page) { Page.create!(title: 'allowed') }

  describe 'GET :index' do
    render_views

    let(:action) { get :index }

    context 'when signed in (fake)' do
      let!(:allowed_page) { Page.create!(title: 'allowed') }
      let!(:disallowed_page) { Page.create!(title: 'disallowed') }

      before { allow(controller).to receive(:current_user).and_return(User.new) }

      it 'filters the resources by what a user can access' do
        action
        expect(controller.resources).to match_array [allowed_page]
      end
    end

    context 'when not signed in' do
      let!(:disallowed_page) { Page.create!(title: 'disallowed') }

      it 'returns no resources' do
        action
        expect(controller.resources).to be_empty
      end
    end
  end

  describe 'GET :new' do
    render_views

    let(:action) { get :new }

    context 'when signed in' do
      before { allow(controller).to receive(:current_user).and_return(User.new) }

      it 'generates a new resource' do
        expect { action }.to_not raise_error
        expect(controller.resource).to be_a Page
      end
    end

    context 'when not signed in' do
      it 'raises a NotAuthorized exception' do
        expect { action }.to raise_error /not allowed to new?/
      end
    end
  end

  describe 'POST :create' do
    let(:action) do
      post :create, page: {title: 'Some title'}
    end

    context 'when signed in' do
      before { allow(controller).to receive(:current_user).and_return(User.new) }

      it 'creates a new resource' do
        expect { action }.to change { Page.count }.from(0).to(1)
      end

      it 'redirects to :index by default' do
        action
        expect(response).to redirect_to pages_path
      end
    end

    context 'when an anon user' do
      it 'raises a NotAuthorized exception' do
        expect { action }.to raise_error /not allowed to create?/
      end

      it 'does not create a new page' do
        expect { action rescue nil }.to_not change { Page.count }
      end
    end
  end

  describe 'GET :edit' do
    render_views

    let(:action) { get :edit, id: page.id }

    context 'when signed in' do
      before { allow(controller).to receive(:current_user).and_return(User.new) }
    end

    context 'when an anon user' do
      it 'raises a 404 exception' do
        expect { action }.to raise_error /Couldn't find Page/
      end
    end
  end

  describe 'PUT :update' do
    let(:action) do
      put :update, id: page.id, page: {title: 'New Title'}
    end

    context 'when signed in' do
      before { allow(controller).to receive(:current_user).and_return(User.new) }

      it 'updates the page' do
        expect { action }.to change { page.reload.title }.from('allowed').to('New Title')
      end
    end

    # 404 error when not within scope
    context 'when an anon user' do
      it 'raises a 404 exception' do
        expect { action }.to raise_error /Couldn't find Page/
      end
    end
  end

  describe 'DELETE :destroy' do
    let(:action) { delete :destroy, id: page.id }

    context 'when signed in' do
      before { allow(controller).to receive(:current_user).and_return(User.new) }

      # Not Authorized Error (e.g. handle and redirect)
      it 'raises a NotAuthorized exception' do
        expect { action }.to raise_error /not allowed to destroy/
      end
    end
  end
end
