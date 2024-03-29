@extends('layout.master')

@push('plugin-styles')
    <link href="{{ asset('assets/plugins/datatables-net/dataTables.bootstrap4.css') }}" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css
                                                                                                                                                                                                                      ">
    <link rel="stylesheet"
        href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css
                                                                                                                                                                                                                      ">
    <link rel="stylesheet"
        href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.bootstrap4.min.css
                                                                                                                                                                                                                      ">
    <link rel="stylesheet" href="{{ asset('backend/js/custom-default.css') }}" id="custom-style">
    <style>


    </style>
@endpush
@section('content')
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4>product Adjusment</h4>
                        </div>
                        <div class="card-body">
                            <p class="font-italic text-muted"><small>The field labels marked with * are required input
                                    fields.</small></p>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <form method="POST" enctype="multipart/form-data" id="addProductCategoryFrom">
                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Warehouse *</label>
                                                    <select required name="warehouse_id" id="warehouse_id"
                                                        class="selectpicker form-control" data-live-search="true"
                                                        data-live-search-style="begins">
                                                        <option selected disabled>Select Warehouse</option>
                                                        @foreach ($warehouse as $warehouse)
                                                            <option value="{{ $warehouse->id }}">{{ $warehouse->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Attach Document</label>

                                                    <input type="file" name="document" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label>Select Product</label>
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-md btn-secondary rounded-0"><i
                                                            class="fa fa-barcode"></i></button>
                                                    <input class="form-control" type="text" onkeyup="search()"
                                                        name="productcodeSearch" id="productcodeSearch"
                                                        placeholder="Please type product code and select..." />
                                                </div>
                                                <input type="hidden"
                                                    class="bg-primary  text-normal text-light text-capitalize"
                                                    style="margin-left:50px; margin-right:auto;" id="show">
                                                <input id="result" type="hidden" type="text">
                                            </div>
                                        </div>





                                        <div class="row mt-5">
                                            <div class="col-md-12">
                                                <h5>Order Table *</h5>
                                                <div class="table-responsive mt-3">
                                                    <table id="myTable" class="table table-hover order-list">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Code</th>
                                                                <th>Quantity</th>
                                                                <th>Action</th>

                                                                <th><i data-feather="trash"></i></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="each_product">
                                                        </tbody>

                                                        <tfoot class="tfoot active">
                                                            <tr>
                                                                <th colspan="2">Total</th>
                                                                <th colspan="2" id="total-qty" name="totalqty"></th>
                                                                <th><i class="dripicons-trash"></i></th>
                                                            </tr>
                                                        </tfoot>

                                                    </table>
                                                    <input type="hidden" id="total-qty" value="" name="total_qty" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-2">

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Note</label>
                                                    <textarea rows="5" class="form-control" name="note"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" value="Submit" class="btn btn-sm btn-info"
                                                id="submit-button">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $('#productcodeSearch').on('input', function() {
                //    var customer_id = $('#customer_id').val();
                temp_data = $('#productcodeSearch').val();
                var warehouse = $('#warehouse_id').val();


                if (!warehouse) {
                    $('#productcodeSearch').val(temp_data.substring(0, temp_data.length - 1));

                    swal("Warning !!!", "Please select Warehouse!", "warning");
                }

            });

            function search() {


                $("#productcodeSearch").autocomplete({

                    source: function(request, response) {
                        $.ajax({
                            url: '/search',
                            type: 'post',
                            dataType: "json",
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            data: {
                                search: request.term
                            },
                            success: function(data) {
                                response(data);
                                console.log(data);
                            }
                        });
                    },
                    select: function(event, ui) {
                        $('#productcodeSearch').val(ui.item.label); // display the selected text
                        $('#result').val(ui.item.value);
                        return false;
                    }
                });


            }

            function hello() {
                console.log("MMMMMMMMMMMMMMMMMMMMM");
            }


            var selected_product = []
            $(document).bind('click keyup', '#productcodeSearch', function() {

                if (!selected_product.includes($('#result').val())) {
                    selected_product.push($('#result').val());
                    var id;
                    $.ajax({
                        url: '/find/' + $('#result').val(),
                        method: 'GET',


                        success: function(data) {
                            console.log(data);
                            console.log(data);
                            console.log("WAWAWAWAWA");
                            console.log(data.warehouse);


                            function getRandomNumber(min, max) {
                                let step1 = max - min + 1;
                                let step2 = Math.random() * step1;
                                let result = Math.floor(step2) + min;
                                return result;
                            }

                            function createArrayofNumbers(start, end) {
                                let myArray = [];
                                for (let i = start; i <= end; i++) {
                                    myArray.push(i);
                                }
                                return myArray;
                            }
                            let numbersArray = createArrayofNumbers(1, 5000000);
                            let randomIndex = getRandomNumber(0, numbersArray.length - 1);
                            let randomNumber = numbersArray[randomIndex];
                            numbersArray.splice(randomIndex, 1);



                            //              id =Math.floor(Math.random() * 5);;
                            id = randomNumber;


                            console.log(id);
                            console.log("WAWAWAWAWA*************************");
                            console.log(data.ware);
                            console.log("PPPPPPPPPPPPPPPPPPPPPPP");
                            console.log(data.product);
                            console.log("LLLLLLLLLLLLDDDDDDDDDDDDAAAAAAAAAAAAAAA");
                            var discount = 10.00;
                            var tax = 32.00;
                            var row = ""
                            row = row + "<tr>"
                            row = row + "<td>" + data.product['name'] +
                                " <input type='hidden' min='1' name='p_id[]' value='" + data.product[
                                    'id'] + "' class='r'></td>"
                            row = row + "<td >" + data.product['barcode_symbology'] + "</td>"

                            row = row + "<td><input type='number' min='1' name='qty[]' id='quenty" +
                                id + "' onkeyup='myFunction(" + id +
                                ")' class='qty'><input type='hidden' min='1'  id='quenty1" + id +
                                "' value='" + data.product['qty'] +
                                "' ><input type='hidden' min='1'  id='quenty2" + id + "' value='" + data
                                .warehouse + "' ></td>"
                            //                        row = row + "<td><input  readonly type='number'class='unit_rate no-border' value='" + data['price'] + "'/></td>"
                            //                        row = row + "<td><input   readonly type='number'class='discount no-border' value='" + discount + "'/></td>"
                            //                        row = row + "<td><input   readonly type='number'class='tax no-border' value='" + tax + "'/></td>"
                            //                        row = row + "<td><input   readonly type='number' class='sub-total no-border' value='" + (1 * data['price'] + tax - discount) + "'/></td>" //{qty}*{unit_rate}+{tax}-{disc}


                            row = row +
                                "<td><select name='method[]' class='form-control'><option value='1'>Addition </option>  <option value='2'>Subtraction</option></select></td>";

                            row = row +
                                "<td><button class='btn btn-danger remove' id='remove'>Delete</button></td>"

                            row = row + "</tr>"
                            $('#each_product').append(row);
                            $('#productcodeSearch').val('');










                        }






                    })


                }
            });

            $('tbody').on('click', '.remove', function() {
                $(this).parent().parent().remove();
            })
            $(document).ready(function() {
                //    $("#myTable").on('click','.remove',function(){
                //        $(this).parent().parent().remove();

                //    });
                $("#myTable").on("click", ".remove", function(event) {

                    selected_product.pop($('#result').val());
                    calculateTotal();
                });
            });


            $(document).bind('click keyup', '#each_product', function() {
                $('tr').each(function() {
                    var unit_rate = parseInt($(this).find('.unit_rate').val())
                    var discount = parseInt($(this).find('.discount').val())
                    var tax = parseInt($(this).find('.tax').val())
                    var qty = parseInt($(this).find('.qty').val())
                    $(this).find('.sub-total').val(qty * unit_rate + tax - discount);
                });
                calculateTotal();
            });

            function calculateTotal() {
                //Sum of quantity
                var total_qty = 0;
                $(".qty").each(function() {
                    if ($(this).val() == '') {
                        total_qty += 0;
                    } else {
                        total_qty += parseFloat($(this).val());
                    }
                });
                $("#total-qty").text(total_qty);
                $('input[name="total_qty"]').val(total_qty);

                //Sum of discount


                //            var total_discount = 0;
                //            $(".discount").each(function () {
                //                total_discount += parseFloat($(this).val());
                //            });
                //            $("#total-discount").text(total_discount.toFixed(2));
                //            $('input[name="total_discount"]').val(total_discount.toFixed(2));

                //Sum of tax
                //            var total_tax = 0;
                //            $(".tax").each(function () {
                //                total_tax += parseFloat($(this).val());
                //            });
                //            $("#total-tax").text(total_tax.toFixed(2));
                //            $('input[name="total_tax"]').val(total_tax.toFixed(2));

                //Sum of subtotal
                //            var total = 0;
                //            $(".sub-total").each(function () {
                //                total += parseFloat($(this).val());
                //            });
                //            $("#total").text(total.toFixed(2));
                //            $('input[name="total_cost"]').val(total.toFixed(2));

                calculateGrandTotal();
            }

            function calculateGrandTotal() {

                var item = $('table.order-list tbody tr:last').index();

                var total_qty = parseFloat($('#total-qty').text());
                var subtotal = parseFloat($('#total').text());
                var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
                var order_discount = parseFloat($('input[name="order_discount"]').val());
                var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());
                var Recieve_amount = parseFloat($('input[name="paying_amount"]').val());


                if (!order_discount)
                    order_discount = 0.00;
                if (!shipping_cost)
                    shipping_cost = 0.00;
                if (!shipping_cost)
                    shipping_cost = 0.00;

                item = ++item + '(' + total_qty + ')';
                order_tax = (subtotal - order_discount) * (order_tax / 100);
                var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;

                var change_amount = (Recieve_amount - grand_total);

                $('#item').text(item);
                $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
                $('#subtotal').text(subtotal.toFixed(2));
                $('#order_tax').text(order_tax.toFixed(2));
                $('#order_discount').text(order_discount);
                $('#shipping_cost').text(shipping_cost.toFixed(2));
                $('#grand_total').text(grand_total.toFixed(2));
                $('input[name="paid_amount"]').val(grand_total.toFixed(2));
                $('#change').text(change_amount.toFixed(2));

            }
            $("#payment").hide();
            $(".card-element").hide();
            $("#gift-card").hide();
            $("#cheque").hide();

            $('select[name="payment_status"]').on("change", function() {
                var payment_status = $(this).val();
                if (payment_status == 3 || payment_status == 4) {
                    $("#paid-amount").prop('disabled', false);
                    $("#payment").show();
                    $("#paying-amount").prop('required', true);
                    $("#paid-amount").prop('required', true);
                    if (payment_status == 4) {
                        $("#paid-amount").prop('disabled', true);
                        $('input[name="paying_amount"]').val($('input[name="grand_total"]').val());
                        $('input[name="paid_amount"]').val($('input[name="grand_total"]').val());
                    }
                } else {
                    $("#paying-amount").prop('required', false);
                    $("#paid-amount").prop('required', false);
                    $('input[name="paying_amount"]').val('');
                    $('input[name="paid_amount"]').val('');
                    $("#payment").hide();
                }
            });

            $('#addProductCategoryFrom').on('submit', function(event) {
                event.preventDefault(event);
                //console.log("BBBBBBBBBBBBBBBBB");

                //alert($('input[name="method"]').val());
                var formData = new FormData(this);

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '/admin/add-productWarehouse',
                    method: "POST",
                    data: formData,
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function(response) {
                        console.log(response);
                        if (response['not']) {
                            swal("Warning!", "Not Sufficient product available in Warehouse!",
                                "warning");
                        } else {
                            swal("Inserted!", "Datass has been Successfully Insert!", "success");
                        }


                        window.location.href = "/Adjustment/list";

                        //alert(data.id);
                    },
                    error: function(data) {

                        console.log(data);
                        swal("Warning!", "All The Field is required!", "warning");



                    }
                })
            });

        </script>

        <script>
            $("#productcodeSearch").keyup(function() {

                //if ($('#warehouse_id option:selected').get().length>0) {
                //    alert('no Warehouse is selected');
                //}
            });

        </script>
        <script>
            function myFunction(id) {
                console.log(id);
                var qty = parseFloat($("#quenty" + id).val());
                console.log("Value is " + qty);
                var qty1 = parseFloat($("#quenty1" + id).val());
                console.log("Value is " + qty1);
                var qty2 = parseFloat($("#quenty2" + id).val());
                console.log("Value is " + qty2);
                var qty3 = (qty + qty2);
                var qty4 = (qty1 - qty2);
                if (qty3 > qty1) {
                    swal("Alert!!!", "You Cannot take more then " + qty4 + " Product!!!")
                    $("#quenty" + id).val('');
                }
            }

        </script>
    @endsection
    @push('plugin-scripts')
        <script src="{{ asset('assets/plugins/datatables-net/jquery.dataTables.js') }}"></script>
        <script src="{{ asset('assets/plugins/datatables-net-bs4/dataTables.bootstrap4.js') }}"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
            integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    @endpush
    @push('custom-scripts')
        <script src="{{ asset('assets/js/data-table.js') }}"></script>
    @endpush
