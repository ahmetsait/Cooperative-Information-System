<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCooperativeMemberRequest;
use App\Http\Requests\UpdateCooperativeMemberRequest;
use App\Repositories\CooperativeMemberRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
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
        $cooperativeMembers = $this->cooperativeMemberRepository->all();

        return view('cooperative_members.index')
            ->with('cooperativeMembers', $cooperativeMembers);
    }

    /**
     * Show the form for creating a new CooperativeMember.
     *
     * @return Response
     */
    public function create()
    {
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
     * Display the specified CooperativeMember.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $cooperativeMember = $this->cooperativeMemberRepository->find($id);

        if (empty($cooperativeMember)) {
            Flash::error('Cooperative Member not found');

            return redirect(route('cooperativeMembers.index'));
        }

        return view('cooperative_members.show')->with('cooperativeMember', $cooperativeMember);
    }

    /**
     * Show the form for editing the specified CooperativeMember.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $cooperativeMember = $this->cooperativeMemberRepository->find($id);

        if (empty($cooperativeMember)) {
            Flash::error('Cooperative Member not found');

            return redirect(route('cooperativeMembers.index'));
        }

        return view('cooperative_members.edit')->with('cooperativeMember', $cooperativeMember);
    }

    /**
     * Update the specified CooperativeMember in storage.
     *
     * @param int $id
     * @param UpdateCooperativeMemberRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCooperativeMemberRequest $request)
    {
        $cooperativeMember = $this->cooperativeMemberRepository->find($id);

        if (empty($cooperativeMember)) {
            Flash::error('Cooperative Member not found');

            return redirect(route('cooperativeMembers.index'));
        }

        $cooperativeMember = $this->cooperativeMemberRepository->update($request->all(), $id);

        Flash::success('Cooperative Member updated successfully.');

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
        $cooperativeMember = $this->cooperativeMemberRepository->find($id);

        if (empty($cooperativeMember)) {
            Flash::error('Cooperative Member not found');

            return redirect(route('cooperativeMembers.index'));
        }

        $this->cooperativeMemberRepository->delete($id);

        Flash::success('Cooperative Member deleted successfully.');

        return redirect(route('cooperativeMembers.index'));
    }
}
