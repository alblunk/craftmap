desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
   uri = URI.parse('http://www.farallon.co/')
   Net::HTTP.get(uri)
 end