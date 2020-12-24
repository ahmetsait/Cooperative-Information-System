<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Flash;

class SolutionsController extends Controller
{

    public function solution_8 () {
        $sql = '(SELECT address FROM cooperatives) UNION (SELECT address FROM farmers);';
//        $sql_count = 'SELECT COUNT(*) FROM (SELECT address FROM cooperatives UNION SELECT address FROM farmers) addr';
        $header = "Sisteme Kayitli Tum Adresler";

        return $this->query_view_generator($header,__FILE__,$sql);
    }


    public function get_custom_query_page () {
        return view('solutions.enterbasequery');
    }

    public function post_custom_query_page (Request $request) {
        $header = $request->get("header");
        $query = $request->get("sql");
        return $this->query_view_generator($header,__FILE__,$query);
    }

    public function base_custom_query () {
        $sql = '(SELECT address FROM cooperatives) UNION (SELECT address FROM farmers);';
        return $this->query_view_generator("Base Query",__FILE__,$sql);
    }








    public function query_view_generator($header, $from, $sql) {
        $query_result = DB::select($sql);

        Flash::success($from . ' dosyasi calisti. Calistirilan Sorgu: <br> ' . $sql );
        return view('solutions.basequery')
            ->with('header',$header)
            ->with('result',$query_result);
    }

}
