class GpsController < ApplicationController
  def index
    render json: {}, status: :ok
  end
  def saveTrackerLocation
    #logger.debug(params)
    status = :ok
    if(request.content_type == 'application/json')
      if(params.key?(:id))
        if (tracker = GpsTracker.where("imei = ? AND mac = ?", params[:id], params[:mac]).first)
          tracker.lat = params[:lat]
          tracker.long = params[:long]
          tracker.save
        else
          status = :internal_server_error
        end
      end
    end
    render json: {}, status: status
  end
  def getTrackerLocations
    #Initialize JSON
    result = {result: []}
    GpsTracker.find_each do |tracker|
      result[:result].push({:lat => tracker.lat, :long => tracker.long})
    end
    logger.debug(result)
    render json: result, status: :ok
  end
end
