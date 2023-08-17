import 'package:flutter/material.dart';
import 'package:UCTATI/model/griditem.dart';

const gridItems = [
  GridItem(
    title: 'Library',
    icon: Icons.library_books_outlined,
    url: 'https://library.uctati.edu.my/',
  ),
  GridItem(
    title: 'E-Directory',
    icon: Icons.search_outlined,
    url: 'http://uctati.edu.my/eDirectory/mainPage.php',
  ),
  GridItem(
    title: 'Webmail',
    icon: Icons.email_outlined,
    url:
        'https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=4765445b-32c6-49b0-83e6-1d93765276ca&redirect_uri=https%3A%2F%2Fwww.microsoft365.com%2Flandingv2&response_type=code%20id_token&scope=openid%20profile%20https%3A%2F%2Fwww.office.com%2Fv2%2FOfficeHome.All&response_mode=form_post&nonce=638242059672833513.YmRhZTliMTAtNDMxOS00NzIyLTkyZGMtMWVkMGI4YjNkYzYzMjZhNjNkODUtMmNhNS00NjViLWFkYTctOTRmYjEzYjRhZTQz&ui_locales=en-US&mkt=en-US&state=HmJ1qFXbtXpk6vXonNXTfs50J5v9vUj69QSkLjRqDyt6puRInBS84fRxNk3LUd52EgICNla9v7OtQXLDGHUbPSN1BijOPxaOZVLpAaviI8bMHSudFwjZG7cGNlsj9YTUamK3Ryie4nno9LcS1d28PvQxmI8mi59tzX4IwJdzRuO_Mepbivbzt9GxlZNuWirtVuVBiXFPEyCYZtxH7dHqaZG6gcpc1iRYECS-Qw9aiZMvMyNzLJuVGsEq_phdHjlmL2KNfNJBhPo0RXU2jZJ0-CKKE5w2rQGcuN3gyIFGgOAjSQvOogfKDWwwqkrbgr0_&x-client-SKU=ID_NET6_0&x-client-ver=6.30.1.0&sso_reload=true',
  ),
  GridItem(
    title: 'E-Aduan',
    icon: Icons.report_problem_outlined,
    url: 'https://www.tatiuc.edu.my/eAduan.html',
  ),
];

const gridItemsStudent = [
  GridItem(
    title: 'Student Portal',
    icon: Icons.school_outlined,
    url: 'http://ecampus.tatiuc.edu.my/pelajar/indexssl.php',
  ),
  GridItem(
    title: 'Alumni',
    icon: Icons.group_outlined,
    url: 'http://ecampus.tatiuc.edu.my/alumni/',
  ),
  GridItem(
    title: 'Research & Innovation',
    icon: Icons.article_outlined,
    url: 'https://www.tatiuc.edu.my/RESEARCH%20.html',
  ),
];

const gridItemsStaff = [
  GridItem(
    title: 'E-Staff',
    icon: Icons.people_outlined,
    url: 'http://estaff.tatiuc.edu.my/',
  ),
  GridItem(
    title: 'Lecturer Portal',
    icon: Icons.assignment_ind_outlined,
    url: 'http://ecampus.tatiuc.edu.my/pensyarah/',
  ),
];
