<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\warehouse\WarehouseModel;
use App\product_warehouse;
use App\Product;
use App\User;
use App\Purchase;
use DB;
use App\Adjusment;
use Auth;
use App\Productadjusment;

class AdjustmentController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $warehouse = WarehouseModel::all();
        return view('admin/Add Adjustment/addAdjustment', ['warehouse' => $warehouse]);
        //       return view('admin/Add Adjustment/addAdjustment',['categories' => $categories]);
    }

    public function searchState(Request $request)
    {
        $p_name = $request->p_name;
        $searchdata = Product::query()->where('name', 'LIKE', "%{$p_name}%")->get();
        if ($searchdata) {
            foreach ($searchdata as $product) {
                echo '<option value="' . $product->id . '">' . $product->name . '</option>';
                //                echo '<option value="' . $product->id . '">' . $product->name . '</option>';
                //                echo $product->name ;        
                //              echo  ` <li class="ui-menu-item"><div id="ui-id-5" tabindex="-1" class="ui-menu-item-wrapper">"' . $product->id . '"</div></li>`;
            }
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function adjustmentList()
    {
        // $adjusment =  \App\Adjusment::all();
        $adjusment =  \App\Adjusment::all();


        // $adjusment =  DB::table('productadjusments')
        //     ->join('adjusments', 'productadjusments.adjusments_id', '=', 'adjusments.id')
        //     ->join('warehouses', 'adjusments.warehouse_id', '=', 'warehouses.id')
        //     ->join('products', 'productadjusments.product_id', '=', 'products.id')

        //     ->select('adjusments.*', 'warehouses.name', 'products.name as p_name', 'productadjusments.qty as p_qty')
        //     ->get();
        return view('admin/add Adjustment/AdjustmentList', ['adjusment' => $adjusment]);
    }

    public function adjustmentListedit($id)


    {
        $adjusment =  \App\Adjusment::find($id);
        $ad_id = $adjusment->id;

        $product_adjustment_check_edit = Productadjusment::where('adjusments_id', $id)->get();
        $count_product = $product_adjustment_check_edit->count();












        //******************************************** */
        //*************************************************** */
        $adjusmentedit =  DB::table('adjusments')
            //     ->join('adjusments', 'productadjusments.adjusments_id', '=', 'adjusments.id')
            ->join('warehouses', 'adjusments.warehouse_id', '=', 'warehouses.id')
            //     ->join('products', 'productadjusments.product_id', '=', 'products.id')

            ->select('adjusments.*', 'warehouses.*')
            ->first();
        // $productadjusments = DB::table('productadjusments')->where('adjusments_id', $id)->first();


        $productadjusments =  DB::table('productadjusments')
            ->join('adjusments', 'productadjusments.adjusments_id', '=', 'adjusments.id')
            // ->join('warehouses', 'adjusments.warehouse_id', '=', 'warehouses.id')
            ->join('products', 'productadjusments.product_id', '=', 'products.id')
            ->where('productadjusments.adjusments_id', '=', $ad_id)
            ->select('adjusments.*',  'products.*', 'productadjusments.qty as p_qty', 'productadjusments.note')
            ->get();

        $productadjusments2 =  DB::table('productadjusments')
            ->join('adjusments', 'productadjusments.adjusments_id', '=', 'adjusments.id')
            // ->join('warehouses', 'adjusments.warehouse_id', '=', 'warehouses.id')
            ->join('products', 'productadjusments.product_id', '=', 'products.id')
            // ->where('productadjusments.adjusments_id', '=',$ad_id )
            ->select('adjusments.*',  'products.*', 'productadjusments.qty as p_qty', 'productadjusments.note')
            ->first();


        //$count_product = $productadjusments->count();

        $all_purchase = Purchase::all();
        $warehouse = WarehouseModel::all();

        return view('admin/Add Adjustment/editAdjustment', ['warehouse' => $warehouse, 'adjusmentedit' => $adjusmentedit, 'productadjusments' => $productadjusments, 'productadjusments2' => $productadjusments2, 'ad_id' => $ad_id]);
        //return view('admin/product/productList', compact('all_category'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function Search(Request $request)
    {

        $search = $request->search;

        if ($search == '') {
            $product = Product::orderby('name', 'asc')->select('id', 'barcode_symbology', 'name')->limit(5)->get();
        } else {
            $product = Product::orderby('name', 'asc')->select('id', 'barcode_symbology', 'name')
                ->where('barcode_symbology', 'like', '%' . $search . '%')
                ->OrWhere('name', 'like', '%' . $search . '%')
                ->limit(5)->get();
        }
        $response = array();
        foreach ($product as $pro) {
            $response[] = array("value" => $pro->id, "label" => $pro->barcode_symbology . ' (' . $pro->name . ')');
        }


        //        if ($product) {
        //            foreach ($product as $product) {
        //                echo '<option value="' . $product->id . '">' . $product->name . '</option>';
        //               
        //            }
        //        }


        return response()->json($response);
    }

    public function Find(Request $request, $id)
    {
        $data = Product::find($id);
        $product_id = $data->id;
        $warehouse =  DB::table('productadjusments')->where('product_id', $product_id)->get();
        $total_qty = 0;
        foreach ($warehouse as $warehouse) {
            $total_qty += $warehouse->qty;
        }
        //  return response()->json($data);
        return response()->json([
            'product' => $data,
            'warehouse' => $total_qty,
            'ware' => $warehouse,
        ]);
        //        return response()->json($data);
    }

    public function addProductCategory(Request $request)
    {

        $flag = [];

        $pid = $request->p_id;
        $id = $request->user()->id;
        $name = Auth::user()->name;
        $reference_id = $name;

        if ($request->hasFile('document')) {
            $edit_img = $request->file('document');
            $edit_photo_uname = md5(time() . rand()) . '.' . $edit_img->getClientOriginalExtension();
            $edit_img->move(public_path('uploads/product/category'), $edit_photo_uname);
            //            $id = $request->user()->name;
        }

        foreach ($request->p_id as $key => $p_id) {
            $warehouse_product_check =  Product_warehouse::where('product_id', '=', $p_id)->where('warehouse_id', '=', $request->warehouse_id)->first();
            if ($warehouse_product_check) {
                if ($request->method[$key] == 2) {
                    if ($warehouse_product_check->qty > $request->qty[$key]) {
                        $flag[$key] = '1';
                        // Status code here
                    } else {
                        $flag[$key] = '0';
                    }
                }
            } else {
                $flag[$key] = '1';
            }
        }

        if (in_array('0', $flag)) {
            return response()->json(['not' => 'No Sufficient product available in Warehouse']);
        } else {
            $adjustment = new Adjusment();
            $adjustment->reference_id = $reference_id;
            $adjustment->warehouse_id = $request->warehouse_id;
            $adjustment->total_qty = $request->total_qty;

            //            $adjustment->document = $edit_photo_uname;
            $adjustment->note = $request->note;
            $adjustment->save();
            $n_id = $adjustment->id;

            //=========================================


            foreach ($request->p_id as $key => $p_id) {
                $data = new \App\Productadjusment();
                $data->adjusments_id = $n_id;
                $data->product_id = $p_id;
                $data->qty = $request->qty[$key];
                $data->note = $request->note;
                $data->save();
            }


            foreach ($request->p_id as $key => $p_id) {
                $warehouse_product_check =  Product_warehouse::where('product_id', '=', $p_id)->where('warehouse_id', '=', $request->warehouse_id)->first();
                if ($warehouse_product_check) {
                    if ($p_id == $warehouse_product_check->product_id && $request->warehouse_id == $warehouse_product_check->warehouse_id) {

                        if ($request->method[$key] == 1) {
                            $new_quantity = $warehouse_product_check->qty + $request->qty[$key];
                            $warehouse_product_check->qty = $new_quantity;
                            $warehouse_product_check->update();
                        } else {
                            $new_quantity = $warehouse_product_check->qty - $request->qty[$key];
                            $warehouse_product_check->qty = $new_quantity;
                            $warehouse_product_check->update();
                        }
                    }
                } else {
                    $data = new \App\product_warehouse();
                    $data->warehouse_id = $request->warehouse_id;
                    $data->product_id = $p_id;
                    $data->qty = $request->qty[$key];
                    $data->save();
                }
            }
        }
    }


    public function addProductCategory2(Request $request, $id)
    {
        //return $request->all();
        $flag = [];
        $adjustment_id_edit = $id;
        $pid = $request->p_id;
        $id = $request->user()->id;
        $name = Auth::user()->name;
        $reference_id = $name;

        if ($request->hasFile('document')) {
            $edit_img = $request->file('document');
            $edit_photo_uname = md5(time() . rand()) . '.' . $edit_img->getClientOriginalExtension();
            $edit_img->move(public_path('uploads/product/category'), $edit_photo_uname);
            //            $id = $request->user()->name;
        }

        foreach ($request->p_id as $key => $p_id) {
            $warehouse_product_check =  Product_warehouse::where('product_id', '=', $p_id)->where('warehouse_id', '=', $request->warehouse_id)->first();
            if ($warehouse_product_check) {
                if ($request->method[$key] == 2) {
                    if ($warehouse_product_check->qty > $request->qty[$key]) {
                        $flag[$key] = '1';
                        // Status code here
                    } else {
                        $flag[$key] = '0';
                    }
                }
            } else {
                $flag[$key] = '1';
            }
        }

        if (in_array('0', $flag)) {
            return response()->json(['not' => 'No Sufficient product available in Warehouse']);
        } else {
            //$adjustment = new Adjusment();
            $adjustment_check =  Adjusment::where('id', '=', $adjustment_id_edit)->where('warehouse_id', '=', $request->warehouse_id)->first();
            if ($adjustment_check) {
                $adjustment_check->reference_id = $reference_id;
                $adjustment_check->warehouse_id = $request->warehouse_id;
                $adjustment_check->total_qty = $request->total_qty;
                $adjustment_check->update();
            } else {
                $adjustment = new Adjusment();
                $adjustment->reference_id = $reference_id;
                $adjustment->warehouse_id = $request->warehouse_id;
                $adjustment->total_qty = $request->total_qty;

                //            $adjustment->document = $edit_photo_uname;
                $adjustment->note = $request->note;
                $adjustment->save();
            }

            $n_id = $adjustment_check->id;

            //=========================================


            foreach ($request->p_id as $key => $p_id) {
                $product_adjustment_check =  Productadjusment::where('adjusments_id', '=', $n_id)->where('product_id', '=', $p_id)->first();
                if ($product_adjustment_check) {
                    $product_adjustment_check->qty = $request->qty[$key];
                    $product_adjustment_check->note = $request->note;
                    $product_adjustment_check->update();
                } else {
                    $data = new \App\Productadjusment();
                    $data->adjusments_id = $n_id;
                    $data->product_id = $p_id;
                    $data->qty = $request->qty[$key];
                    $data->note = $request->note;
                    $data->save();
                }
            }


            foreach ($request->p_id as $key => $p_id) {
                $warehouse_product_check =  Product_warehouse::where('product_id', '=', $p_id)->where('warehouse_id', '=', $request->warehouse_id)->first();
                if ($warehouse_product_check) {
                    if ($p_id == $warehouse_product_check->product_id && $request->warehouse_id == $warehouse_product_check->warehouse_id) {

                        if ($request->method[$key] == 1) {
                            $new_quantity = $warehouse_product_check->qty + $request->qty[$key];
                            $warehouse_product_check->qty = $new_quantity;
                            $warehouse_product_check->update();
                        } else {
                            $new_quantity = $warehouse_product_check->qty - $request->qty[$key];
                            $warehouse_product_check->qty = $new_quantity;
                            $warehouse_product_check->update();
                        }
                    }
                } else {
                    $data = new \App\product_warehouse();
                    $data->warehouse_id = $request->warehouse_id;
                    $data->product_id = $p_id;
                    $data->qty = $request->qty[$key];
                    $data->save();
                }
            }
        }
    }


    public function adjustmentListdelete($id)
    {

        Productadjusment::where('adjusments_id', $id)->delete();

        $adjusment =  \App\Adjusment::find($id);

        $adjusment->delete();


        $adjusment =  \App\Adjusment::all();


        return view('admin/add Adjustment/AdjustmentList', ['adjusment' => $adjusment]);
    }
}