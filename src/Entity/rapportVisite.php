<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\rapportVisiteRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=rapportVisiteRepository::class)
 */
class rapportVisite
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $RAP_NUM;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $RAP_DATE;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $RAP_BILAN;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $RAP_MOTIF;

    /**
     * @ORM\ManyToOne(targetEntity=visiteur::class, inversedBy="rapports")
     */
    private $visiteur;

    /**
     * @ORM\ManyToOne(targetEntity=praticien::class, inversedBy="rapportVisites")
     * @ORM\JoinColumn(nullable=false)
     */
    private $praticien;

    /**
     * @ORM\OneToMany(targetEntity=Offre::class, mappedBy="rapport")
     */
    private $offres;

    public function __construct()
    {
        $this->offres = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRAPNUM(): ?int
    {
        return $this->RAP_NUM;
    }

    public function setRAPNUM(int $RAP_NUM): self
    {
        $this->RAP_NUM = $RAP_NUM;

        return $this;
    }

    public function getRAPDATE(): ?\DateTimeInterface
    {
        return $this->RAP_DATE;
    }

    public function setRAPDATE(?\DateTimeInterface $RAP_DATE): self
    {
        $this->RAP_DATE = $RAP_DATE;

        return $this;
    }

    public function getRAPBILAN(): ?string
    {
        return $this->RAP_BILAN;
    }

    public function setRAPBILAN(?string $RAP_BILAN): self
    {
        $this->RAP_BILAN = $RAP_BILAN;

        return $this;
    }

    public function getRAPMOTIF(): ?string
    {
        return $this->RAP_MOTIF;
    }

    public function setRAPMOTIF(?string $RAP_MOTIF): self
    {
        $this->RAP_MOTIF = $RAP_MOTIF;

        return $this;
    }

    public function getVisiteur(): ?visiteur
    {
        return $this->visiteur;
    }

    public function setVisiteur(?visiteur $visiteur): self
    {
        $this->visiteur = $visiteur;

        return $this;
    }

    public function getPraticien(): ?praticien
    {
        return $this->praticien;
    }

    public function setPraticien(?praticien $praticien): self
    {
        $this->praticien = $praticien;

        return $this;
    }

    /**
     * @return Collection|Offre[]
     */
    public function getOffres(): Collection
    {
        return $this->offres;
    }

    public function addOffre(Offre $offre): self
    {
        if (!$this->offres->contains($offre)) {
            $this->offres[] = $offre;
            $offre->setRapport($this);
        }

        return $this;
    }

    public function removeOffre(Offre $offre): self
    {
        if ($this->offres->removeElement($offre)) {
            // set the owning side to null (unless already changed)
            if ($offre->getRapport() === $this) {
                $offre->setRapport(null);
            }
        }

        return $this;
    }
}
