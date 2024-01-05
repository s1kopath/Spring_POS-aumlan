@extends('layout.master')

@push('plugin-styles')
    <link href="{{ asset('assets/plugins/datatables-net/dataTables.bootstrap4.css') }}" rel="stylesheet" />
@endpush

@section('content')

    @if (session()->has('alert'))
        <script>
            swal("Deleted!", "Product has been Successfully Delete!", "success");

        </script>
    @endif

    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title" style="font-size: 1.5rem !important">Product List</h1>

                    <div class="card-header" style="width:100%; padding: 15px 0px !important">
                        <a class="btn btn-sm btn-info" href="{{ route('admin.addProduct') }}">Add New Product</a>
                    </div>

                    <div class="table-responsive">
                        <table id="dataTableExample" class="dataTables_wrapper dt-bootstrap4 no-footer" width="100%"
                            cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Code</th>
                                    <th>Brand</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($all_product as $product)
                                    <tr>
                                        <td> <img src="/uploads/product/image/{{ $product->image }}"
                                                class="rounded-circle" width="65px" height="65px"></img></td>
                                        <td>{{ $product->name }}</td>
                                        <td>{{ $product->barcode_symbology }}</td>
                                        <td>{{ $product->brands->name }}</td>
                                        <td>{{ $product->categories->category_name }}</td>
                                        <td>{{ $product->qty }}</td>
                                        <td>{{ $product->price }}</td>

                                        <td>

                                            <a href="{{ route('admin.editProduct', [$product->id]) }}"
                                                id="{{ $product->id }}"> <i data-feather="edit"></i></a>
                                            <a href="{{ url('/admin/delete-productList', $product->id) }}"
                                                id="{{ $product->id }}"> <i data-feather="delete"></i></a>
                                        </td>

                                    </tr>
                                @endforeach


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <!-- delete Expense -->
    <div id="delete_expense_modal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Expense</h4>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="mess"></div>
                    <form id="ss" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">

                            <input type="hidden" name="expenseID">
                            <h4>Are You Sure? </h4>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input id="deleteExpense" class="btn btn-info btn-block " type="submit" value="Delete">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="btn btn-info btn-block " value="Cancel" data-dismiss="modal">
                                </div>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Product Details XXXX -->
    <div id="product_details_modal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="mess"></div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Product Type *</strong> </label>
                                <span id="type_model"> </span>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Product Name *</strong> </label>
                                <span id="name_model"> </span>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Product Code *</strong> </label>
                                <span id="code_model"> </span>
                            </div>
                        </div>

                        <div id="combo" class="col-md-9 mb-1">
                            <label>Add Product</label>
                            <div class="search-box input-group mb-3">
                                <button class="btn btn-secondary"><i class="fa fa-barcode"></i></button>
                                <input type="text" name="product_code_name" id="lims_productcodeSearch"
                                    placeholder="Please type product code and select..." class="form-control" />
                            </div>
                            <label>Combo Products</label>
                            <div class="table-responsive">
                                <table id="myTable" class="table table-hover order-list">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Unit Price</th>
                                            <th><i class="dripicons-trash"></i></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Brand</strong> </label>
                                <span id="brand_model"> </span>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Category *</strong> </label>
                                <span id="category_model"> </span>

                            </div>
                        </div>
                        <div id="unit" class="col-md-12">
                            <div class="row ">
                                <div class="col-md-4 form-group">
                                    <label>Product Unit * </strong> </label>
                                    <span id="unit_model"> </span>

                                </div>
                            </div>
                        </div>
                        <div id="cost" class="col-md-4">
                            <div class="form-group">
                                <label>Product Cost *</strong> </label>
                                <span id="cost_model"> </span>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Product Price *</strong> </label>
                                <span id="price_model"> </span>
                            </div>
                            <div class="form-group">
                                {{-- <input type="hidden" name="qty" value="0.00"> --}}
                            </div>
                        </div>

                        <div id="alert-qty" class="col-md-4">
                            <div class="form-group">
                                <label>Alert Quantity</strong> </label>
                                <span id="alert_model"> </span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Product Tax</strong> </label>
                                <span id="tax_model"> </span>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Tax Method</strong> </label> <i class="dripicons-question" data-toggle="tooltip"
                                    title="Exclusive: Poduct price = Actual product price + Tax. Inclusive: Actual product price = Product price - Tax"></i>
                                <span id="taxMethod_model"> </span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group mt-3">
                                <label>Featured</label>

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Product Image</strong> </label> <i class="dripicons-question" data-toggle="tooltip"
                                    title="You can upload multiple image. Only .jpeg, .jpg, .png, .gif file can be uploaded. First image will be base image."></i>
                                <div id="imageUpload" style="border: 1px solid silver">
                                    <img style="width: 150px; height:150px; display:block; border-radius: 4px;"
                                        id="doctor_update_img_load" src="" alt="Product Image">
                                    <input name="doctor_old_photo" type="hidden">

                                    <input type="file" id="doc_new_img" name="imageProduct" class="form-control">
                                </div>
                                <span class="validation-msg" id="image-error"></span>
                            </div>
                        </div>

                    </div>



                </div>
            </div>
        </div>
    </div>

































@endsection

@push('plugin-scripts')

    <script src="{{ asset('assets/plugins/datatables-net/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-net-bs4/dataTables.bootstrap4.js') }}"></script>
@endpush

@push('custom-scripts')
    <script src="{{ asset('backend/js/expense.js') }}"></script>
    <script src="{{ asset('assets/js/data-table.js') }}"></script>
@endpush
