require 'rails_helper'

describe BusinessPolicy do
  subject { BusinessPolicy.new(user, business) }

  let(:business) { FactoryGirl.create(:business) }

  context "for an application officer" do
    let(:user) { FactoryGirl.create(:user, role: 'application_officer') }

    it { should permit(:show)    }

    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should_not permit(:destroy) }
  end

  context "for a system administrator" do
    let(:user) { FactoryGirl.create(:user, role: 'system_administrator') }

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end

  context "for a payment officer" do
    let(:user) { FactoryGirl.create(:user, role: 'payment_officer') }

    it { should permit(:show)    }
    it { should_not permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end
end
