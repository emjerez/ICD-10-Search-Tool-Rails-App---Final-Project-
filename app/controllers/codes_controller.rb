class CodesController < ApplicationController
def index
  @codes = Code.all
end

def show
  @code = Code.find params[:id]
end


end

# private
#   def codes_params
#     params.require(:code).permit :title, :text
#   end
#
# end
