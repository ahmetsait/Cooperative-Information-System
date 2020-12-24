@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1 class="pull-left">Lütfen Bir Select Sorgusu Giriniz</h1>
    </section>
    <div class="content">
        <div class="clearfix"></div>

        @include('flash::message')

        <div class="clearfix"></div>
        <div class="box box-primary">
            <div class="box-body">

                {!! Form::open(['route' => 'postbasequery','method' => 'POST'] ) !!}

                <!-- Header Field -->
                    <div class="form-group col-sm-6">
                        {!! Form::label('header', 'Sorgunuza İsim Giriniz:') !!}
                        {!! Form::text('header', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
                    </div>

                <!-- Name Field -->
                    <div class="form-group col-sm-6">
                        {!! Form::label('sql', 'Select İçeren Sql Sorgunuzu Yazınız:') !!}
                        {!! Form::textarea('sql', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
                    </div>

                    <!-- Submit Field -->
                    <div class="form-group col-sm-12">
                        {!! Form::submit('Calistir', ['class' => 'btn btn-primary']) !!}
                    </div>

                {!! Form::close() !!}

            </div>
        </div>
        <div class="text-center">

        </div>
    </div>
@endsection

