require 'rails_helper'

describe PaymentPolicy do
  subject { PaymentPolicy.new(user, payment) }

  let(:payment) { FactoryGirl.create(:payment) }

  context "for an application officer" do
    let(:user) { create(:user, role: 'payment_officer') }

    it { should permit_authorization(:show)    }

    it { should permit_authorization(:create)  }
    it { should permit_authorization(:new)     }
    it { should permit_authorization(:update)  }
    it { should permit_authorization(:edit)    }
    it { should permit_authorization(:destroy) }
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
end
