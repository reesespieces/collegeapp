Sequel.migration do
  up do
    create_table(:colleges) do
      primary_key :__id__

      String :name, :null => false
      String :address
      String :city
      String :state
      String :zipcode
      String :phone
      String :website

    end
  end

  down do
    drop_table(:colleges)
  end
end