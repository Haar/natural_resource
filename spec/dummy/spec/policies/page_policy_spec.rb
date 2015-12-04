require 'rails_helper'

describe PagePolicy do
  let(:model) { } # Page.new
  subject { described_class.new(user, model)  }

  context 'when a standard user' do
    let(:user) { User.new }

    # it { is_expected.to permit_auth(:action) }
  end

  context 'when an anon user' do
    let(:user) { User.new }

    # it { is_expected.to_not permit_auth(:action) }
  end

  describe PagePolicy::Scope do
    context 'when a standard user' do
      let(:user) { } # User.new
    end

    context 'when a anon user' do
      let(:user) { nil }
    end
  end
end
