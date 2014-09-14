# encoding: UTF-8
# Question#is_mandatory is now false by default.

survey "ET Corporate Report", :default_mandatory => false do

  section "Company details" do

    # label "These questions are about the Company"

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

  section "Carbon Emissions" do
    # label "These questions are about the Carbon Emissions"

    group "Carbon emissions" do
      q "Reporting period", pick: :one
      a "1 January 2011 to 31 December 2012"
      a "Other", :string

      q "Please enter your carbon emissions in metric tonnes of CO2e:"
      a "Scope 1|tCO2e", :integer
      a "Scope 2|tCO2e", :integer
      a "Scope 3|tCO2e", :integer

      q "Please enter the breakdown of your Scope 3 Upstream emissions:"
      a "Purchased goods and service", :integer
      a "Capital Goods", :integer
      a "Fuel - and Energy - related Activites not included in Scope 1 + 2", :integer
      a "Transportation & Distribution (Upstream)", :integer
      a "Waste Generation in Operations", :integer
      a "Business Travel", :integer
      a "Employee Commuting", :integer
      a "Leased Assets (Upstream)", :integer
      a "Investments", :integer

      q "Please enter the breakdown of your Scope 3 Downstream emissions:"
      a "Transportation & Distribution (Downstream)", :integer
      a "Processing of Sold Products", :integer
      a "Use of Sold Products", :integer
      a "End-of-Life Treatment of Sold products", :integer
      a "Leased Assets (Downstream)", :integer
      a "Franchises", :integer

      q "Total gross emissions:"
      a  :integer, "tCO2e"

      q "Green tariff Energy Purchased:"
      a  :integer

      q "Total net emissions:"
      a  :integer, "tCO2e"
    end

    group "Other greenhouse gases" do
      q "Does your Company produce any greenhouse gases which are not covered by the Kyoto basket of 6 gases?", pick: :one
      a "Yes"
      a "No"

      q "If you have answered yes to the previous question what percentage do they represent of the total and have they been included in the Scope 1,2 and 3 calculations listed above?"
      a :string
    end
  end

  section "Boundary Settings" do
    q "What reporting boundary method have you adopted under the terms of the GHG Protocol?"
    a :string

    group "Scope of Reporting: Scope 1 & 2" do
      q "Do the gross emissions reported for Scope 1 & 2 as defined by the GHG Protocol represent 100% of your company's emissions for these Scopes?"
      a "Yes"
      a "No"

      q "If you have answered no to the previous question, what percentage of your company's operations do they represent?"
      a :string
    end

    group "Scope of Reporting: Scope 3" do
      q "How many Scope 3 categories does your company disclose data for?"
      a :integer

      q "Which Scope 3 categories does your company measure data for?"
      a :string

      q "Please attach a full breakdown with the percentage coverage for each:"
      a #upload button document
    end

  end

  section "Verification/Assurance (to be completed by an independent third party)" do
    q "Name of Verifier:"
    a :string

    q "Which standard has been used to assure the data? (E.g. ISO 14064, AA1000AS etc)"
    a :string

    q "Which Scopes have been verified?", pick: :any
    a "Scope 1", :answer Other
    a "Scope 2", :answer Other
    a "Scope 3", :answer Other

    q "If the company is reporting Scope 3 emissions, has it covered all of the Scopes accurately (for Scope 3 please refer to the GHG Protocol new Corporate Value Chain (Scope 3) Accounting and Reporting Standard), inclusing any GHGs not covered by the GHG Protocol which may be material?"
    a "Yes", :string
    a "No"

    q "Are there any material issues issues with the numbers represented for the Company under Scope 1, 2 or 3?"
    a "Yes"
    a "No"

    q "Is the data presented by the company representative of the company's entire scope of operations?"
    a "Yes"
    a "No",
    # If no, approximately what percentage does it cover? :string

    q "Please state any other further comments or qualifications:"
    a :string

    q "Please attach the verification full statement"
    a #upload button to attach a verification full statement
  end

end
