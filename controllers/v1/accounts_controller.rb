module V1

  class AccountsController < ApplicationController

     def index
        accounts = current_user.accounts

        render :index, locals: { accounts: accounts }
     end

     def create
      @account = current_user.accounts.build(account_params)

      if @account.save
        render :create, status: :created
      else
        head(:unprocessable_entity)
      end
     end

     def update
       @account = current_user.accounts.friendly.find(params[:id])

       if @account.update(account_params)
         render :update
      else
        head(:unprocessable_entity)
      end
     end

    private

    def account_params
       params.require(:account).permit(:name,:vat_rate, :default_currency, :address, :tax_payer_id)
    end
  end
end
