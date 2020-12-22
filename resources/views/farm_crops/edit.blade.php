@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Farm Crop
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($farmCrop, ['route' => ['farmCrops.update', $farmCrop->id], 'method' => 'patch']) !!}

                        @include('farm_crops.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection