FactoryGirl.define do
  factory :job do
    description "Ceci est un test"
    latitude 50.8174495
    longitude 4.3783142
    zip 1050
    title "Test"
    user "User test"
  
    factory :job_no_zip do
      description "Ceci est un test sans zip"
      latitude 50.8174495
      longitude 4.3783142
      zip ""
      title "Test no zip"
      user "No zip test"
    end

    factory :job_no_zip_nothing do
      description "Ceci est un test sans rien"
      latitude ""
      longitude ""
      zip ""
      title "Test sans rien"
      user "No coord test"
    end

    factory :job_no_zip_no_coord do
      description "Ceci est un test sans coord"
      latitude ""
      longitude ""
      zip 1050
      title "Test sans coord"
      user "No coord test"
    end
  end
end