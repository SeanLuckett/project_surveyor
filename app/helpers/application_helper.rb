module ApplicationHelper
  def show_home_button
    unless request.fullpath == '/'
      '<div class="row">
         <div class="col-sm-12"><a href="/">Back to Home</a></div>
       </div>'.html_safe
    end
  end
end
