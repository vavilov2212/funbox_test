defmodule FunboxTestWeb.GetDomainsTest do
  use FunboxTestWeb.ConnCase
  import FunboxTestWeb.GetDomains

  test "define \"from\" param" do
    assert from(%{from: "1", to: "3"}) == 1
  end

  test "define \"to\" param" do
    assert to(%{from: "1", to: "3"}) == 3
  end

  test "Redis get RECORDS in range of /GET params" do
    db_records1 = ["somelink1","somelink2","somelink3"] 
    db_records2 = ["somelink1","somelink2","somelink3"] 
    db_records3 = ["somelink1","somelink2","somelink3"] 
    all_records = db_records1 ++ db_records2 ++ db_records3
    assert get_all_records(%{from: "1", to: "3"}) == all_records
  end

end
