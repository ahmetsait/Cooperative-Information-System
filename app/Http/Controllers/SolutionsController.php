<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Flash;

class SolutionsController extends AppBaseController
{

    public function solution_8 () {
        $header = "Sisteme Kayitli Tum Adresler";
        $sql = '(SELECT address FROM cooperatives) UNION (SELECT address FROM farmers);';
        return $this->query_view_generator($header,__FILE__,$sql);
    }


    public function solution_9 () {
        $sql = 'SELECT f.name, f.surname FROM farmers f, farms fa, farmcrop fc, crops c WHERE f.id=fa.owner_id AND fc.farm_id=fa.id AND c.id=fc.crop_id AND c.name=\'Barbunya\';';
        $header = "Barbunya eken çiftçiler";

        return $this->query_view_generator($header,__FILE__,$sql);
    }

    public function solution_10_get (Request $request) {
        $header = "Verilen Mahsulu Eken Ciftcilerden Kooperatife Uye Olanların Kooperatiflerinin İsimlerini ve Kendi İsimlerini Listeleyen Sorgu";
        $sql = "SELECT fr.name as CiftciIsim,co.name as KooperatifIsmi FROM cooperativemember cm
                LEFT JOIN farmers fr
                ON cm.member_id = fr.id
                LEFT JOIN cooperatives co
                ON cm.cooperative_id = co.id
                WHERE cm.member_id
                IN (
                	SELECT fm2.owner_id as farmer_id FROM farms fm2
                	LEFT JOIN farmcrop fc
                	ON fm2.id = fc.farm_id
                	WHERE fc.crop_id IN (SELECT cr.id as crop_id FROM crops cr
                						WHERE cr.name = '" . "MAHSUL_ISMI" . "'
                						)
        );";

        $this->query_info_flasher(__FILE__,$sql);
        return view('solutions.solution10get')
            ->with('header',$header);
    }


    public function solution_10_post (Request $request) {
        $input = $request->get('input');
        $header = $input . " Mahsulunu Eken Ciftcileri ve Uye Olduklari Kooperatifleri Listeleyen Sorgu";
        $sql = "SELECT fr.name as CiftciIsim,co.name as KooperatifIsmi FROM cooperativemember cm
                LEFT JOIN farmers fr
                ON cm.member_id = fr.id
                LEFT JOIN cooperatives co
                ON cm.cooperative_id = co.id
                WHERE cm.member_id
                IN (
                	SELECT fm2.owner_id as farmer_id FROM farms fm2
                	LEFT JOIN farmcrop fc
                	ON fm2.id = fc.farm_id
                	WHERE fc.crop_id IN (
                	    SELECT cr.id as crop_id FROM crops cr
        				WHERE cr.name = '" . $input . "'
                						)
                );";
        return $this->query_view_generator($header,__FILE__,$sql,'solutions.solution10get');
    }

    public function solution_11_get () {
        $header = "Verilen Mahsulu Eken Ciftcileri İsim ve Soyisimleri";
        $sql = "SELECT name, surname
                FROM farmers f, farms fa, farmcrop fc, crops c
                WHERE f.id=fa.owner_id AND fc.farm_id=fa.id
                AND c.id=fc.crop_id AND c.name='MAHSUL_ISMI'";
        $this->query_info_flasher(__FILE__,$sql);
        return view('solutions.11')
            ->with('header',$header);
    }


    public function solution_11_post (Request $request) {
        $input = $request->get('input');
        $header = $input . " Mahsulunu Eken Ciftcilerin İsim ve Soyisimleri";
        $sql = "SELECT f.name, f.surname
                FROM farmers f, farms fa, farmcrop fc, crops c
                WHERE f.id=fa.owner_id AND fc.farm_id=fa.id
                AND c.id=fc.crop_id AND c.name='" . $input . "' ;";
        return $this->query_view_generator($header,__FILE__,$sql,'solutions.solution10get');
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


}
