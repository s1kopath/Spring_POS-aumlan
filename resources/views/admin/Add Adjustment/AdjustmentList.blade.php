@extends('layout.master')

@push('plugin-styles')
    <link href="{{ asset('assets/plugins/datatables-net/dataTables.bootstrap4.css') }}" rel="stylesheet" />
@endpush

@section('content')


    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title" style="font-size: 1.5rem !important">Product Adjustment List</h1>

                    <div class="card-header" style="width:100%; padding: 15px 0px !important">
                        <a class="btn btn-sm btn-info" href="{{ url('/add_Adjustment') }}">ADD Product Adjustment</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTableExample" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Reference No.</th>
                                    <th>Ware House id</th>

                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($adjusment as $key => $adjusment)
                                    <tr>
                                        <th><span>{{ $adjusment->updated_at }}</span></th>
                                        <th>
                                            <span>{{ $adjusment->reference_id }}</span>
                                        </th>
                                        <th>{{ $adjusment->warehouse_id }}</th>
                                        <th>{{ $adjusment->total_qty }}</th>

                                        <th>
                                            {{-- <a href="JavaScript:void(0)" id="add_payment_modal"
                                                data-id="{{  $adjusment->id }}" id="{{  $adjusment->id }}"
                                                class="btn btn-info px-2 py-0"> $</a> --}}
                                            <a href="{{ url('admin/edit-adjustment', $adjusment->id) }}"
                                                id="{{ $adjusment->id }}"> <i data-feather="edit"></i></a>
                                            <a href="{{ url('admin/delete-adjustment', $adjusment->id) }}"
                                                id="{{ $adjusment->id }}"> <i data-feather="delete"></i></a>
                                        </th>

                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
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
