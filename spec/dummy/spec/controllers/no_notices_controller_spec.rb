require 'rails_helper'

describe NoNoticesController do
  describe 'display_notices: false' do
    describe 'POST :create' do
      let(:action) { post :create, page: {title: 'Some title'} }

      context 'when authorized' do
        before { allow(controller).to receive(:current_user).and_return(User.new) }

        context 'on success' do
          before { action }
          it 'redirects to success_path' do
            expect(response).to redirect_to no_notices_path
          end

          it 'does not display a flash' do
            expect(flash[:notice]).to be_nil
          end
        end
      end
    end
  end
end
