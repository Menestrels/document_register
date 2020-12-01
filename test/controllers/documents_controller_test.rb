require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should not get index if not logged in" do
    get documents_url
    assert_response :redirect
  end

  test "should get index" do
    sign_in users(:one)
    get documents_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    sign_in users(:one)
    assert_difference('Document.count') do
      post documents_url, params: { document: { description: @document.description, name: @document.name, user_id: @document.user_id } }
    end

    assert_redirected_to document_url(Document.last)
  end

  test "should not create document with no name" do
    sign_in users(:one)
    assert_no_difference 'Document.count' do
      post documents_url, params: { document: { description: @document.description, name: nil, user_id: @document.user_id } }
    end
  end

  test "should not show document" do
    sign_in users(:two)
    get document_url(@document)
    assert_response :redirect
  end

  test "should show document" do
    sign_in users(:one)
    get document_url(@document)
    assert_response :success
  end

  test "should not get edit" do
    sign_in users(:two)
    get edit_document_url(@document)
    assert_response :redirect
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_document_url(@document)
    assert_response :success
  end

  test "should not update document" do
    sign_in users(:two)
    patch document_url(@document), params: { document: { description: @document.description, name: @document.name, user_id: @document.user_id } }
    assert_redirected_to root_path
  end

  test "should update document" do
    sign_in users(:one)
    patch document_url(@document), params: { document: { description: @document.description, name: @document.name, user_id: @document.user_id } }
    assert_redirected_to document_url(@document)
  end

  test "should not destroy document" do
    sign_in users(:two)
    assert_no_difference 'Document.count' do
      delete document_url(@document)
    end

    assert_redirected_to root_path
  end

  test "should destroy document" do
    sign_in users(:one)
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
  end
end
