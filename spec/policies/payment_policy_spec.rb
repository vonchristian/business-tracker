require 'rails_helper'

describe PaymentPolicy do
  subject { PaymentPolicy.new(user, payment) }

  let(:payment) { FactoryGirl.create(:payment) }

  context "for an application officer" do
    let(:user) { create(:user, role: 'payment_officer') }

    it { should permit(:show)    }

    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
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
end
