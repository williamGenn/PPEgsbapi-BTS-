<?php

namespace App\Entity;

use App\Repository\laboRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiFilter;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;


/**
 * @ApiResource(
 *      itemOperations={
 *          "get" = {
 *              "normalization_context"={
 *                  "groups"={"LAB","LAB_VIS","VIS"}
 *              }
 *          }
 *      },
 *      collectionOperations= {
 *           "get" = {
 *              "normalization_context"={
 *                  "groups"={"LAB"}
 *              }
 *          }
 *      },
 * )
 * @ORM\Entity(repositoryClass=laboRepository::class)
 * @ApiFilter(SearchFilter::class, properties= {
 *  "id":"exact", "LAB_CODE":"exact"
 * })
 */
class labo
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups("LAB")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=2)
     * @Groups("LAB")
     */
    private $LAB_CODE;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     * @Groups("LAB")
     */
    private $LAB_NOM;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Groups("LAB")
     */
    private $LAB_CHEFVENTE;

    /**
     * @ORM\OneToMany(targetEntity=visiteur::class, mappedBy="departement")
     * @Groups("LAB_VIS")
     */
    private $Visiteurs;

    public function __construct()
    {
        $this->Visiteurs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLABCODE(): ?string
    {
        return $this->LAB_CODE;
    }

    public function setLABCODE(string $LAB_CODE): self
    {
        $this->LAB_CODE = $LAB_CODE;

        return $this;
    }

    public function getLABNOM(): ?string
    {
        return $this->LAB_NOM;
    }

    public function setLABNOM(?string $LAB_NOM): self
    {
        $this->LAB_NOM = $LAB_NOM;

        return $this;
    }

    public function getLABCHEFVENTE(): ?string
    {
        return $this->LAB_CHEFVENTE;
    }

    public function setLABCHEFVENTE(?string $LAB_CHEFVENTE): self
    {
        $this->LAB_CHEFVENTE = $LAB_CHEFVENTE;

        return $this;
    }

    /**
     * @return Collection|visiteur[]
     */
    public function getVisiteurs(): Collection
    {
        return $this->Visiteurs;
    }

    public function addVisiteur(visiteur $visiteur): self
    {
        if (!$this->Visiteurs->contains($visiteur)) {
            $this->Visiteurs[] = $visiteur;
            $visiteur->setDepartement($this);
        }

        return $this;
    }

    public function removeVisiteur(visiteur $visiteur): self
    {
        if ($this->Visiteurs->removeElement($visiteur)) {
            // set the owning side to null (unless already changed)
            if ($visiteur->getDepartement() === $this) {
                $visiteur->setDepartement(null);
            }
        }

        return $this;
    }
}
