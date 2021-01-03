@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Mahsul Düzenle
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
                   {!! Form::model($crop, ['route' => ['crops.update', $crop->id], 'method' => 'patch']) !!}

                        @include('crops.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection
