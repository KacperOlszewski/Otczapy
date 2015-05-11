module ApplicationHelper
    
    def error(object)
	
	render(:partial =>'special/errors', :locals=>{:object => object})

    end
    
end
