<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCooperativeMemberRequest;
use App\Repositories\CooperativeMemberRepository;
use Illuminate\Http\Request;
use Flash;
use Illuminate\Support\Facades\DB;
use Response;

class CooperativeMemberController extends AppBaseController
{
    /** @var  CooperativeMemberRepository */
    private $cooperativeMemberRepository;

    public function __construct(CooperativeMemberRepository $cooperativeMemberRepo)
    {
        $this->cooperativeMemberRepository = $cooperativeMemberRepo;
    }

    /**
     * Display a listing of the CooperativeMember.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $header = "Kooperatif Üyeleri";
        $sql =
            'SELECT cooperatives.name as "Uye Olunan Koop.", farmers.name as "Uye Isim",
            cooperativemember.registration , cooperativemember.cooperative_id as "coop_id",
            cooperativemember.member_id as "member_id"
            FROM cooperatives, cooperativemember, farmers
            WHERE cooperatives.id = cooperativemember.cooperative_id AND
            farmers.id = cooperativemember.member_id';

        return $this->query_view_generator($header,__FILE__,$sql,'cooperative_members.index','cooperative_members-index.jpg');
    }

    /**
     * Show the form for creating a new CooperativeMember.
     *
     * @return Response
     */
    public function create()
    {
        $sql = 'INSERT INTO cooperativemember (cooperative_id,member_id,registration) VALUES (form.cooperative_id,form.member_id,form.registration); ';
        $this->query_info_flasher(__FILE__,$sql);
        return view('cooperative_members.create');
    }

    /**
     * Store a newly created CooperativeMember in storage.
     *
     * @param CreateCooperativeMemberRequest $request
     *
     * @return Response
     */
    public function store(CreateCooperativeMemberRequest $request)
    {
        $input = $request->all();

        $cooperativeMember = $this->cooperativeMemberRepository->create($input);

        Flash::success('Cooperative Member saved successfully.');

        return redirect(route('cooperativeMembers.index'));
    }


    /**
     * Remove the specified CooperativeMember from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $coop_id = intval(explode('-',$id)[0]);
        $member_id = explode('-',$id)[1];
        $sql = "SELECT * FROM cooperativemember WHERE member_id='" . ($member_id) . "'  AND cooperative_id=" . $coop_id . " ;";
        $cooperativeMember = DB::select($sql);

        if (empty($cooperativeMember)) {
            Flash::error('Cooperative Member not found');
            return redirect(route('cooperativeMembers.index'));
        }

        $sql_delete = "DELETE FROM cooperativemember WHERE member_id='" . ($member_id) . "'  AND cooperative_id=" . $coop_id . " ;";
        if (DB::statement($sql_delete)) {
            Flash::success('Cooperative Member deleted successfully.');
        } else {
            Flash::error('Cooperative Member Could Not Deleted');

        }
        return redirect(route('cooperativeMembers.index'));
    }
}
