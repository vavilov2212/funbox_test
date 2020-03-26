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
    db_records1 = ["record1","record2","record3"] 
    db_records2 = ["record1","record2","record3"] 
    db_records3 = ["record1","record2","record3"] 
    all_records = db_records1 ++ db_records2 ++ db_records3
    assert get_all_records(%{from: "1", to: "3"}) == all_records
  end

  test "Make sure param \"to\" is greater then \"from\" true" do
    params = %{from: "1", to: "3"}
    assertion_result = true 
    assert assert_from_is_greater(params) == assertion_result
  end

  test "Make sure param \"to\" is greater then \"from\" false" do
    params = %{from: "3", to: "1"}
    assertion_result = false
    assert assert_from_is_greater(params) == assertion_result
  end

end
