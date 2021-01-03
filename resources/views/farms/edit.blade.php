@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Arsa Düzenle
        </h1>
   </section>
   <div class="content">
       <div class="box box-primary">
           <div class="box-body">
               @include('flash::message')
               <div class="clearfix"></div>
           </div>
       </div>


       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($farm, ['route' => ['farms.update', $farm->id], 'method' => 'patch']) !!}

                        @include('farms.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection
