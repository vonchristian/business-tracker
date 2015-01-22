require 'rails_helper'

describe BusinessPolicy do
  subject { BusinessPolicy.new(user, business) }

  let(:business) { FactoryGirl.create(:business) }

  context "for an application officer" do
    let(:user) { FactoryGirl.create(:user, role: 'application_officer') }

    it { should permit_authorization(:show)    }

    it { should permit_authorization(:create)  }
    it { should permit_authorization(:new)     }
    it { should permit_authorization(:update)  }
    it { should permit_authorization(:edit)    }
    it { should_not permit_authorization(:destroy) }
  end

  context "for a system administrator" do
    let(:user) { FactoryGirl.create(:user, role: 'system_administrator') }

    it { should permit_authorization(:show)    }
    it { should permit_authorization(:create)  }
    it { should permit_authorization(:new)     }
    it { should permit_authorization(:update)  }
    it { should permit_authorization(:edit)    }
    it { should permit_authorization(:destroy) }
  end

  context "for a payment officer" do
    let(:user) { FactoryGirl.create(:user, role: 'payment_officer') }

    it { should permit_authorization(:show)    }
    it { should_not permit_authorization(:create)  }
    it { should permit_authorization(:new)     }
    it { should permit_authorization(:update)  }
    it { should_not permit_authorization(:edit)    }
    it { should_not permit_authorization(:destroy) }
  end
end
