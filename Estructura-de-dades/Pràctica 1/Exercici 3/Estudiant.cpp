//@Author: Javier Pedragosa
#include "Estudiant.h"
#include <iostream>

using namespace E;
using namespace std;

Estudiant::Estudiant(std::string nom, int any_naixement, int assignatures)
{
    this->nom = nom;
    this->any_naixement = any_naixement;
    this->edat = 2022 - any_naixement;
    this->assignatures = assignatures;
}

void Estudiant::print()
{
    cout << "Estudiant(Nom ==> " << this->nom << ", Naixement ==> " <<
    this->any_naixement << ", Assignatures ==> " << this->assignatures << ')' << endl;
}


std::string Estudiant::getNom()
{
    return this->nom;
}


void Estudiant::setNom(std::string nom)
{
    this->nom = nom;
}


int Estudiant::getAnyNaixement()
{
    return this->any_naixement;
}


void Estudiant::setAnyNaixement(int any_naixement)
{
    this->any_naixement = any_naixement;
}


int Estudiant::getEdat()
{
    return this->edat;
}


int Estudiant::getAssignatures()
{
    return this->assignatures;
}


void Estudiant::setAssignatures(int assignatures)
{
    this->assignatures = assignatures;
}


