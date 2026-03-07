.. _Python: https://www.python.org
.. _virtualenv: https://virtualenv.pypa.io
.. _pip: https://pip.pypa.io

=====================
Guide pour Core Space
=====================


Install
*******

Base requirements are `Python`_>=3.10, `pip`_, `virtualenv`_ and Makefile.

Then you can start to install this project: ::

    make install


Usage
*****

Le projet contient un Makefile avec toute les commandes nécessaires dont la commande
principale pour générer la documentation (avec les rapports d'analyses) en HTML: ::

    make html

Une version similaire existe pour générer la version PDF: ::

    make pdf

La version HTML est la version de référence pour rédiger la documentation et pour ce
faire vous pouvez démarrer un serveur simple qui servira la documentation HTML avec la
commande suivante: ::

    make livedoc

Il est nécessaire au préalable de construire la documentation HTML au moins une fois
avant de lancer ce serveur. De plus le serveur surveille les sources et reconstruit la
documentation lorsque ses sources sont modifiées.

Lorsque la documentation actuellement construite en local est prête pour être publiée,
il faut copier son "build" dans le répertoire de publication: ::

    make release

Ensuite vous pouvez commit et pousser sur la branche ``master`` qui publiera le tout.

Diagrammes
----------

La documentation contient des diagrammes construits à partir de certaines sources
textes (``***.mmd``) fait pour `Mermaid <https://www.mermaidchart.com/>`_.

Il faut installer le frontend et attention sous Linux il sera probablement nécessaire
d'installer quelques librairies système car une version 'headless' de Chrome est
utilisé dans le processus: ::

    sudo apt-get install libgbm-dev libasound2t64

En dernier recours on peut aussi éditer la source directement sur l'éditeur en ligne de
Mermaid et exporter son rendu. Dans ce cas il faudra bien penser à mettre à jour la
source ``.mmd`` et l'image de rendu dans les 'statics' de la documentation.

.. Attention::
    Mermaid ne génère des fichiers SVG compatibles uniquement avec les navigateurs.
    Un éditeur vectoriel tel que Inkscape ou autre n'aura pas le rendu correct visible
    dans un navigateur. Ceci parce que Mermaid construit du SVG avec des styles et
    des ``ForeignObject`` complexes qui ne sont pas compatibles avec les éditeurs.

    En résumé, le format PNG est le seul format réellement portable de Mermaid et les
    SVG produit ne sont pas exploitables en dehors d'une page web.


Crédits
*******

All designs © Battle Systems ™ 2022.  https://www.BattleSystems.co.uk

Certains textes peuvent provenir du document *Aides de jeu / Cartes / Résumés des règles pour Core Space* par la communauté de VortexZone https://vortexzone.com/

Le logo SVG et certaines découpes graphiques proviennent de la formidable application de Nico Van den Winckel https://github.com/xinix/core-space

Certains symboles en SVG ont été fait avec ou à partir d'éléments provenant de `SVG Repo <https://www.svgrepo.com>`_.
