module SlidedecksHelper
	def show_slide_bgcolor
    	  "background-color: #{@slide.bgcolor}; 
    	  color: #{@slide.color_scheme};
    	  "
  	end

  	def show_slide_bgimage
  		"background: url(#{@slide.bgimage}) no-repeat center center;
    	  background-size: cover;"
  	end
end
