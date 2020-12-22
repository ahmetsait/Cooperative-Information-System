@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Farm
        </h1>
   </section>
   <div class="content">
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