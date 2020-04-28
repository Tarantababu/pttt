class PiecesController < ApplicationController
    before_action :set_piece, only: [:edit, :update, :show, :destroy]
    
    def index
        @pieces = Piece.paginate(page: params[:page], per_page: 2)
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
        params.require(:piece).permit(:title, :description, :page_number)
    end
end