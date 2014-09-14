# encoding: UTF-8
# Question#is_mandatory is now false by default.

survey "ET Corporate Report", :default_mandatory => false do

  section "Basic questions" do

    label "These questions are about the Company"

    group "Questions about the Company", :display_type => :default do
      q "Company name:"
      a :string

      q "Company website:"
      a :string

      q "Company contact details:"
      a :string
    end

    group "Questions about the Sustainability Department", :display_type => :default do
      q "Sustainability Officer name:"
      a :string

      q "Sustainability Office contact details"
      a :string

      q "Sustainability website:"
      a :string

      q "Sustainability report link:"
      a :string
    end
  end
end
