# encoding: UTF-8
# Question#is_mandatory is now false by default.

survey "ET Corporate Report", :default_mandatory => false do

  section "Page 1" do

    group "Basic questions" do
      label "These questions are about the Company"

      q "Questions about the Company"
      a "Company name:", :string
      a "Company website:", :string
      a "Company contact details:", :string

      q "Questions about the Sustainability Department"
      a "Sustainability Officer name:", :string
      a "Sustainability Office contact details", :string
      a "Sustainability website:", :string
      a "Sustainability report link:", :string
    end

    group "Carbon emissions" do
      q "Reporting period", pick: :one
      a "1 January 2011 to 31 December 2012"
      a "Other", :string
    
      q "Please enter your carbon emissions in metric tonnes of CO2e:"
      a "Scope 1|tCO2e", :integer
      a "Scope 2|tCO2e", :integer
      a "Scope 3|tCO2e", :integer

    end
  end
end
