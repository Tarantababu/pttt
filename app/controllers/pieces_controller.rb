class PiecesController < ApplicationController
    before_action :set_piece, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @pieces = Piece.paginate(page: params[:page], per_page: 5)
    end
    
    def show
    end
    
    def new
        @piece = Piece.new
    end
    
    def create
        @piece = Piece.new(piece_params)
        @piece.user = current_user
        if @piece.save
            flash[:success] = "Piece was created successfully"
            redirect_to piece_path(@piece)
        else
            render 'new'
        end
    end
    
    def edit
    end

    def update
        if @piece.update(piece_params)
            flash[:success] = "Piece was successfully updated"
            redirect_to piece_path(@piece)
        else
            render 'edit'
        end
    end
    
    def destroy
        @piece.destroy
        flash[:danger] = "Piece was successfully deleted"
        redirect_to pieces_path
    end
    
    private
    
    def set_piece
        @piece = Piece.find(params[:id])
    end
    
    def piece_params
        params.require(:piece).permit(:title, :description, :page_number, category_ids: [], piece_ids: [])
    end
    
    def require_same_user
        if current_user != @piece.user && !current_user.admin?
            flash[:danger] = "You can only edit your own pieces"
            redirect_to root_path
        end
    end
end