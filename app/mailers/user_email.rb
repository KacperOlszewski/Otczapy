class UserEmail < ActionMailer::Base
    
    default to: 'kacperolszewski@o2.pl'
     
    def email(name, email, body)
        @name = name
        @email = email
        @body = body 
		
        mail(from: email, subject: 'Zapytanie bezpośrednio z Otczapy.pl')
    end
end