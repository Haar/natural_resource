require '<%= File.exists?('spec/rails_helper.rb') ? 'rails_helper' : 'spec_helper' %>'

describe <%= class_name %>Policy do
  let(:model) { } # <%= class_name %>.new
  subject { described_class.new(user, model)  }

  context 'when a standard user' do
    let(:user) { User.new }

    # it { is_expected.to permit_auth(:action) }
  end

  context 'when an anon user' do
    let(:user) { User.new }

    # it { is_expected.to_not permit_auth(:action) }
  end

  describe <%= class_name %>Policy::Scope do
    context 'when a standard user' do
      let(:user) { } # User.new
    end

    context 'when a anon user' do
      let(:user) { nil }
    end
  end
end
