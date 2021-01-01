<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmerRequest;
use App\Http\Requests\UpdateFarmerRequest;
use App\Repositories\FarmerRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Illuminate\Support\Facades\DB;
use Response;

class FarmerController extends AppBaseController
{
    /** @var  FarmerRepository */
    private $farmerRepository;

    public function __construct(FarmerRepository $farmerRepo)
    {
        $this->farmerRepository = $farmerRepo;
    }

    /**
     * Display a listing of the Farmer.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $header = "Sisteme Kayıtlı Çiftçiler";
        $sql = 'SELECT * FROM farmers ORDER BY experience DESC';
        return $this->query_view_generator($header,__FILE__,$sql,'farmers.index','farmer-index.jpg');
    }

    /**
     * Show the form for creating a new Farmer.
     *
     * @return Response
     */
    public function create()
    {
        $sql = ('INSERT INTO farmers (id,name,surname,birthday,phone,email,address) VALUES (form.id,form.name, form.surname,form.birthday,form.phone,form.email,form.address)');
        $this->query_info_flasher(__FILE__,$sql);
        return view('farmers.create');
    }

    /**
     * Store a newly created Farmer in storage.
     *
     * @param CreateFarmerRequest $request
     *
     * @return Response
     */
    public function store(CreateFarmerRequest $request)
    {
        $input = $request->all();
        $sql = ('INSERT INTO farmers (id,name,surname,birthday,phone,email,address)
                 VALUES (form.id,form.name, form.surname,form.birthday,form.phone,form.email,form.address)');
        $farmer = $this->farmerRepository->create($input);
        return redirect(route('farmers.index'));
    }

    /**
     * Display the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        return view('farmers.show')->with('farmer', $farmer);
    }

    /**
     * Show the form for editing the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found for given id');

            return redirect(route('farmers.index'));
        }

        $sql = ('UPDATE farmers SET id =form.id,name= form.name,surname =form.surname,birthday=form.birthday,phone=form.phone,email=form.email,address=form.address WHERE id=id');
        $this->query_info_flasher(__FILE__,$sql);

        return view('farmers.edit')->with('farmer', $farmer);
    }

    /**
     * Update the specified Farmer in storage.
     *
     * @param int $id
     * @param UpdateFarmerRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmerRequest $request)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }
        $sql = ('UPDATE farmers SET
                 id =form.id,
                 name= form.name,
                 surname =form.surname,
                 birthday=form.birthday,
                 phone=form.phone,
                 email=form.email,
                 address=form.address
                 WHERE id=' . $request->get('id'));
        $farmer = $this->farmerRepository->update($request->all(), $id);

        return redirect(route('farmers.index'));
    }

    /**
     * Remove the specified Farmer from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $farmer = $this->farmerRepository->find($id);
        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }
        $sql = "DELETE FROM farmers WHERE id=" . $id;
        $this->farmerRepository->delete($id);
        Flash::success('Farmer deleted successfully.');
        return redirect(route('farmers.index'));
    }
}
