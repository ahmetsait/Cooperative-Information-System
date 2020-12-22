@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Farmer
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($farmer, ['route' => ['farmers.update', $farmer->id], 'method' => 'patch']) !!}

                        @include('farmers.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection