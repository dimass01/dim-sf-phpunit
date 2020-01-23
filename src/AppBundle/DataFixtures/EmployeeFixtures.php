<?php

namespace App\DataFixtures;

use AppBundle\Entity\Employee;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class EmployeeFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $employee = new Employee();
        $employee->setSalary(1200);
        $employee->setBonus(1000);

        $manager->persist($employee);
        $manager->flush();
    }
}
