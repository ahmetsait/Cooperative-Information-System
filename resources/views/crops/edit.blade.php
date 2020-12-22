@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Crop
        </h1>
   </section>
   <div class="content">
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