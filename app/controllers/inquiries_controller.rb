class InquiriesController < ApplicationController
  def index
    @inquiries = Inquiry.all
  end

  def create
    @rental = Rental.find(params[:rental_id])
    @inquiry = @rental.inquiries.create(inquiry_params)

    redirect_to rental_path(@rental)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update(inquiry_params)

    redirect_to inquiry_path(@inquiry)
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    redirect_to inquiries_path(@inquiries)
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :credit_score, :num_pets, :explain_pets, :phone, :num_tenants, :relation_tenants, :qualification, :inquiry_notes, :admin_notes, :created_at, :email, :rental_id, :inquiry_id)
  end
end
