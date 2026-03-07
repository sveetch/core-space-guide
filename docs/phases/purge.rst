.. _phases_purge_intro:

Phase de la Purge
=================

Cette phase se découpe en deux étapes:

#. **Arrivée** des personnages de la Purge;
#. **Activation** de **tout** les personnages de la Purge **présents** sur le plateau.

Arrivée
*******

L'arrivée se résoud en lisant le compteur d'hostilité dont la dernière épingle décrit
le niveau en cours.

Chaque niveau d'hostilité indique le type de personnage et son nombre. Le nombre est
soit directement un chiffre, soit un dé à lancer :

* :ref:`dices_purge_intro` qui indique un nombre;
* :ref:`dices_luck_intro` dont la face avec l'icône "à capuche" provoque l'arrivée d'un
  personnage "Organique". Tout autre face est ignorée.


.. grid:: 1 1 2 2
    :gutter: 2

    .. grid-item::
        :columns: 12 12 2 2

        .. figure:: /_static/images/purge-entry-token.png
            :align: center

    .. grid-item::
        :columns: 12 12 10 10

        Chaque personnage **arrive** sur un des **6 points d'entrées** numérotés.
        Lancez :ref:`dices_luck_intro` (ou 1d6) pour trouver **sur quel point** le
        personnnage arrive.

.. Attention::
    Si il n'y a **plus de figurine** disponible pour le type de personnage désigné pour
    sortir, on prend une **figurine de rang inférieur**.

    Si il ne reste plus de figurines **disponibles**, **aucun** personnage n'entre.

Activation
**********

Les personnages s'activent selon leur **rang du plus grand au plus faible**. Le joueur
avec le :ref:`turn_counter_intro` arbitre l'ordre entre les personnages de même rang.

Lors de chaque activation d'un personnage, il **détermine sa cible**:

* Un personnage de la Purge n'attaque **jamais** un autre personnage de la Purge;
* **Par défaut** c'est le personnage le plus **proche**, en **ligne de vue** et
  **pas à couvert**;
* Si tout les personnages en ligne de vue sont **à couverts**, ce sera
  **le plus proche**;
* Si il n'y a **personne en ligne de vue** ce sera n'importe quel personnage le plus
  **proche sur le plateau**.

Un personnage ne **change de cible** pendant son tour que si sa **cible a été vaincue**.

.. Note::
    Un **assassin** cible toujours en priorité un capitaine parmi les cibles
    potentielles.

Une fois que le ciblage est déterminé, le personnage peut se déplacer et/ou attaquer
en utilisant ses **points d'actions**. Ses actions seront déterminés d'après le
:ref:`npc_ai_intro`.
