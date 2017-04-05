module Autors
  class AccountsController < AutorController

    def edit
    end

    def update_info

        if current_autor.update(autor_info_params)
          flash[:success] = 'Successfully saved info.'
        else
          flash[:danger] = current_autor.display_error_messages
        end
        redirect_to autors_account_path

      end

    def change_password
      autor = current_autor

      if autor.valid_password?(autor_password_params[:current_password])
       if autor.change_password(autor_password_params)
          sign_in(autor, bypass: true)
          flash[:success] = 'Successfully changed password'
        else
          flash[:danger] = autor.display_error_messages
        end
      else
        flash[:danger] = 'Current password was incorrect.'
      end
      redirect_to autors_account_path
    end

    private
    def autor_info_params
      params.require(:autor).permit(:name, :email, :bio)
    end

    def autor_password_params
      params.require(:autor).permit(:current_password, :new_password, :new_password_confirmation)
    end


  end
end
