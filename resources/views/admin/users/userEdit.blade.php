@extends('layout.master')
@push('plugin-styles')
<link href="{{ asset('assets/plugins/datatables-net/dataTables.bootstrap4.css') }}" rel="stylesheet" />
@endpush
<style>
    body {
    padding-top: 90px;
    }
    .panel-login {
    /* border-color: #ccc; */
    /* -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
    -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
    box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2); */
    }
    .panel-login>.panel-heading {
    color: #00415d;
    background-color: #fff;
    border-color: #fff;
    text-align:center;
    }
    .panel-login>.panel-heading a{
    text-decoration: none;
    color: #666;
    font-weight: bold;
    font-size: 15px;
    -webkit-transition: all 0.1s linear;
    -moz-transition: all 0.1s linear;
    transition: all 0.1s linear;
    }
    .panel-login>.panel-heading a.active{
    color: #029f5b;
    font-size: 18px;
    }
    .panel-login>.panel-heading hr{
    margin-top: 10px;
    margin-bottom: 0px;
    clear: both;
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
    background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
    background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
    background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
    }
    .panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
    height: 45px;
    border: 1px solid #ddd;
    font-size: 16px;
    -webkit-transition: all 0.1s linear;
    -moz-transition: all 0.1s linear;
    transition: all 0.1s linear;
    }
    .panel-login input:hover,
    .panel-login input:focus {
    outline:none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border-color: #ccc;
    }
    .btn-login {
    background-color: #59B2E0;
    outline: none;
    color: #fff;
    font-size: 14px;
    height: auto;
    font-weight: normal;
    padding: 14px 0;
    text-transform: uppercase;
    border-color: #59B2E6;
    }
    .btn-login:hover,
    .btn-login:focus {
    color: #fff;
    background-color: #53A3CD;
    border-color: #53A3CD;
    }
    .forgot-password {
    text-decoration: underline;
    color: #888;
    }
    .forgot-password:hover,
    .forgot-password:focus {
    text-decoration: underline;
    color: #666;
    }
    .btn-register {
    background-color: #1CB94E;
    outline: none;
    color: #fff;
    font-size: 14px;
    height: auto;
    font-weight: normal;
    padding: 14px 0;
    text-transform: uppercase;
    border-color: #1CB94A;
    }
    .btn-register:hover,
    .btn-register:focus {
    color: #fff;
    background-color: #1CA347;
    border-color: #1CA347;
    }
</style>
@section('content')
<div class="row">
    <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title" style="font-size: 1.5rem !important">Edit User</h1>
                <br>
                @if(session('delete_success'))
                <div class="alert alert-success">
                    {{session('delete_success')}}
                </div>
                @endif
                @if(session('edit_successs'))
                <div class="alert alert-success">
                    {{session('edit_successs')}}
                </div>
                @endif
                @if(session('add_successs'))
                <div class="alert alert-success">
                    {{session('add_successs')}}
                </div>
                @endif
                @if(Route::current()->getName() == 'admin.addExpense')
                <div class="card-header" style="width:100%; padding: 15px 0px !important" >
                    <a class="btn btn-sm btn-info" data-toggle="modal" href="#add_expense_modal">Add New Expense</a>
                </div>
                @endif
                <div class="panel panel-login">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form action="{{url('edit_user_post')}}" method="POST">
                                    @csrf
                                    <div class="form-group">
                                        <input type="text" name="name" class="form-control" value="{{$get_user->name}}" placeholder="User Name">
                                        <input type="hidden" name="id" class="form-control" value="{{$get_user->id}}" placeholder="User Name">
                                        @error('name')
                                        <strong class="text-danger">{{$message}}</strong>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" value="{{$get_user->email}}">
                                        @error('email')
                                        <strong class="text-danger">{{$message}}</strong>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Select Status</label>
                                        <select class="form-control" name="status" required>
                                            <option {{ ($get_user->status) == '1' ? 'selected' : '' }} value="1" >Enabled</option>
                                            <option {{ ($get_user->status) == '0' ? 'selected' : '' }} value="0" >Disabled</option>
                                        </select>
                                        @error('status')<i class="text-danger">{{$message}}</i>@enderror
                                    </div>
                                    <div class="form-group">
                                      <label for="status">Select Role</label>
                                      <select class="form-control" name="role" required>
                                          <option {{ ($get_user->role) == '1' ? 'selected' : '' }} value="1" >Admin</option>
                                          <option {{ ($get_user->role) == '2' ? 'selected' : '' }} value="2" >Owner</option>
                                          <option {{ ($get_user->role) == '3' ? 'selected' : '' }} value="3" >Employee</option>
                                      </select>
                                      @error('status')<i class="text-danger">{{$message}}</i>@enderror
                                  </div>


                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
      $("#admin-form").show();
      $("#owner-form").hide();
      $("#employee-form").hide();
    
    
    $('#admin-form-link').click(function(e) {
    $("#admin-form").delay(100).fadeIn(100);
     $("#owner-form").fadeOut(100);
     $("#employee-form").fadeOut(100);
    $('#owner-form-link').removeClass('active');
    $('#employee-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
    });
    $('#owner-form-link').click(function(e) {
    $("#owner-form").delay(100).fadeIn(100);
     $("#admin-form").fadeOut(100);
     $("#employee-form").fadeOut(100);
    $('#admin-form-link').removeClass('active');
    $('#employee-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
    });
    
    $('#employee-form-link').click(function(e) {
    $("#employee-form").delay(100).fadeIn(100);
     $("#admin-form").fadeOut(100);
     $("#owner-form").fadeOut(100);
    $('#admin-form-link').removeClass('active');
    $('#owner-form-link').removeClass('active');
    $(this).addClass('active');
    e.preventDefault();
    });
    
    });
    
</script>
@endsection
@push('plugin-scripts')
<script src="{{ asset('assets/plugins/datatables-net/jquery.dataTables.js') }}"></script>
<script src="{{ asset('assets/plugins/datatables-net-bs4/dataTables.bootstrap4.js') }}"></script>
@endpush
@push('custom-scripts')
<script src="{{ asset('backend/js/expense.js') }}"></script>
<script src="{{ asset('assets/js/data-table.js') }}"></script>
@endpush