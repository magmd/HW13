import UIKit

class SettingsCustomTableViewCell: UITableViewCell {

    let iconBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5

        return view
    }()

    let cellPrimaryText: UILabel = {
        let cellText = UILabel()
        cellText.font = .systemFont(ofSize: 17)

        return cellText
    }()

    let cellPrimaryTextView: UIView = {
        let view = UIView()

        return view
    }()

    let cellSecondaryText: UILabel = {
        let cellText = UILabel()
        cellText.font = .systemFont(ofSize: 16)
        cellText.textColor = .gray

        return cellText
    }()

    let cellSecondaryTextView: UIView = {
        let view = UIView()

        return view
    }()

    let icon: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    let badgeButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red

        return btn
    }()

    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal

        return stackView
    }()

    var settingsCell: SettingsViewController.SettingCellType? {
        didSet {
            guard let settingsItem = settingsCell else { return }

            cellPrimaryText.text = settingsItem.title

            cellSecondaryText.text = settingsItem.detailedText ?? ""

            let image = UIImage(systemName: settingsItem.iconName) ?? UIImage(named: settingsItem.iconName)
            icon.image = image
            icon.tintColor = .white
            icon.contentMode = .scaleAspectFit

            iconBackgroundView.backgroundColor = settingsItem.backgroundColor

            if (settingsItem.badgeCount ?? 0) > 0 {
                badgeButton.setTitle(String(settingsItem.badgeCount ?? 1), for: .normal)
                badgeButton.isHidden = false
                badgeButton.isEnabled = false

                cellSecondaryTextView.addSubview(badgeButton)

                badgeButton.translatesAutoresizingMaskIntoConstraints = false
                badgeButton.centerYAnchor.constraint(equalTo: cellSecondaryTextView.centerYAnchor).isActive = true
                badgeButton.trailingAnchor.constraint(equalTo: cellSecondaryTextView.trailingAnchor, constant: -10).isActive = true
                badgeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
                badgeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true

                badgeButton.layer.cornerRadius = 12.5
            }

            if settingsItem.isToggle ?? false {
                accessoryView = UISwitch()
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        contentView.addSubview(iconBackgroundView)
        iconBackgroundView.addSubview(icon)

        contentView.addSubview(textStackView)

        textStackView.addArrangedSubview(cellPrimaryTextView)
        textStackView.addArrangedSubview(cellSecondaryTextView)

        cellPrimaryTextView.addSubview(cellPrimaryText)

        cellSecondaryTextView.addSubview(cellSecondaryText)
    }

    private func setupLayout() {

        iconBackgroundView.translatesAutoresizingMaskIntoConstraints = false
 
        iconBackgroundView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        iconBackgroundView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:20).isActive = true
        iconBackgroundView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        iconBackgroundView.heightAnchor.constraint(equalToConstant: 31).isActive = true

        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 22).isActive = true

        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: iconBackgroundView.trailingAnchor).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        cellPrimaryTextView.translatesAutoresizingMaskIntoConstraints = false
        cellPrimaryTextView.widthAnchor.constraint(lessThanOrEqualToConstant: 160).isActive = true

        cellPrimaryText.translatesAutoresizingMaskIntoConstraints = false
        cellPrimaryText.centerYAnchor.constraint(equalTo: cellPrimaryTextView.centerYAnchor).isActive = true
        cellPrimaryText.leadingAnchor.constraint(equalTo: cellPrimaryTextView.leadingAnchor, constant: 10).isActive = true

        cellSecondaryTextView.translatesAutoresizingMaskIntoConstraints = false

        cellSecondaryText.translatesAutoresizingMaskIntoConstraints = false
        cellSecondaryText.centerYAnchor.constraint(equalTo: cellSecondaryTextView.centerYAnchor).isActive = true
        cellSecondaryText.trailingAnchor.constraint(equalTo: cellSecondaryTextView.trailingAnchor, constant: -5).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        accessoryType = .disclosureIndicator
        if settingsCell?.isToggle ?? false {
            accessoryView = .none
        }

        if (settingsCell?.badgeCount ?? 0) > 0 {
            badgeButton.isHidden = true
        }
    }
}
