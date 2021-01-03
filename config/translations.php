<?php

return [
    'Farmers_TR' => [
        'id'	=> 'TC Kimlik Numarası',
        'registration'	=> 'Kayıt Tarihi',
        'name'	=> 'İsim',
        'surname'	=> 'Soy İsim',
        'birthday'	=> 'Doğum Tarihi',
        'phone'	=> 'Telefon Numarası',
        'email'	=> 'E-Posta',
        'address'	=> 'Adres',
        'experience'	=> 'Deneyim',
    ],

    'Cities_TR' => [
        'code'	=> 'İl Kodu',
        'name'	=> 'Ad',
        'area'	=> 'Alan',
    ],

    'SoilTypes_TR' => [
        'id'	=> 'ID',
        'name'	=> 'Ad',
    ],

    'Farms_TR' => [
        'id'	=> 'ID',
        'registration'	=> 'Kayıt Tarihi',
        'owner_id'	=> 'Sahibin TC Kimlik Numarası',
        'city_code'	=> 'Bulunduğu İl Kodu',
        'latitude'	=> 'Enlem',
        'longitude'	=> 'Boylam',
        'area'	=> 'Alan',
        'soil_type'	=> 'Toprak Türü',
        'unit_worth'	=> 'Birim Değer',
    ],

    'Crops_TR' => [
        'id'	=> 'ID',
        'name'	=> 'Ad',
        'category'	=> 'Kategori',
        'seed_unit_price'	=> 'Birim Tohum Fiyatı',
        'crop_standard_price'	=> 'Standart Mahsül Fiyatı',
        'experience'	=> 'Getirdiği Deneyim',
    ],

    'FarmCrop_TR' => [
        'farm_id'	=> 'Arsa ID',
        'crop_id'	=> 'Mahsül ID',
        'planting_date'	=> 'Ekim Tarihi',
        'area'	=> 'Ekilen Alan',
    ],

    'Cooperatives_TR' => [
        'id'	=> 'ID',
        'name'	=> 'Ad',
        'establishment_date'	=> 'Kuruluş Tarihi',
        'founder_id'	=> 'Kurucu TC Kimlik Numarası',
        'president_id'	=> 'Başkan TC Kimlik Numarası',
        'city_code'	=> 'Merkez İl Kodu',
        'address'	=> 'Merkez Adresi',
        'email'	=> 'E-Posta',
        'member_count'	=> 'Üye Sayısı',
    ],

    'CooperativeMember_TR' => [
        'cooperative_id'	=> 'Kooperatif ID',
        'member_id'	=> 'Üye TC Kimlik Numarası',
        'registration'	=> 'Kayıt Tarihi',
    ],
];
