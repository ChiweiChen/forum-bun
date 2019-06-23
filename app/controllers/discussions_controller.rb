class DiscussionsController < ApplicationController
    before_action :set_discussion, only: [:show, :edit, :update, :destroy]

    def index
        @discussions = Discussion.all
    end

    def new
        @discussion = Discussion.new
    end
    def show
    end

    def edit
    end
    def update
        respond_to do |format|
          if @discussion.update(discussion_params)
            format.html { redirect_to discussions_url, notice: 'discussion was successfully updated.' }
            format.json { render :show, status: :ok, location: @discussion }
          else
            format.html { render :edit }
            format.json { render json: @discussion.errors, status: :unprocessable_entity }
          end
        end
      end
    
    def create

        puts params['discussion']
        @discussion = Discussion.new()
        @discussion.title = params['discussion']['title']
        @discussion.content=params['discussion']['content']
        @discussion.article_id=params['discussion']['article_id']

        respond_to do |format|
            if @discussion.save
                format.html { redirect_to article_path(params['discussion']['article_id']), notice: 'discussion was successfully created.' }
                
            else
                format.html { render :new }
            end
        end
    end
    def set_discussion
        @discussion = Discussion.find(params[:id])
    end
    def discussion_params
        params.require(:discussion).permit(:title, :content)
    end
    def destroy
      @discussion.destroy
      respond_to do |format|
        format.html { redirect_to discussions_url, notice: 'Discussion was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
end