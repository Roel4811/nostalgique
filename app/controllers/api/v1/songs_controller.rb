class Api::V1::SongsController < Api::V1::BaseController
  
  def index
    respond_with Song.without_deleted.only_active
  end

  # def create
  #   respond_with :api, :v1, Song.create(item_params)
  # end
  #
  def destroy
    respond_with Song.destroy(params[:id])
  end

  def update
    song = Song.find(params["id"])
    song.update_attributes(song_params)
    respond_with song, json: song
  end

  private

    # def song_params
    #   params.require(:song).permit(:id, :name, :lyrics)
    # end

end
