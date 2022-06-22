import UIKit

class SettingsCustomTableViewCell: UITableViewCell {

    private let iconBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5

        return view
    }()

    private let cellPrimaryText: UILabel = {
        let cellText = UILabel()
        cellText.font = .systemFont(ofSize: 17)

        return cellText
    }()

    private let cellPrimaryTextView: UIView = {
        let view = UIView()

        return view
    }()

    private let cellSecondaryText: UILabel = {
        let cellText = UILabel()
        cellText.font = .systemFont(ofSize: 16)
        cellText.textColor = .gray

        return cellText
    }()

    private let cellSecondaryTextView: UIView = {
        let view = UIView()

        return view
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private let badgeButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red

        return btn
    }()

    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal

        return stackView
    }()

    private var isCellToggle: Bool = false

    private var cellBadgeCount: Int = 0

    public func configure(with cell: Settings.SettingCellType) {
        cellPrimaryText.text = cell.title

        cellSecondaryText.text = cell.detailedText ?? ""

        isCellToggle = cell.isToggle ?? false

        cellBadgeCount = cell.badgeCount ?? 0

        let image = UIImage(systemName: cell.iconName) ?? UIImage(named: cell.iconName)
        icon.image = image
        icon.tintColor = .white
        icon.contentMode = .scaleAspectFit

        iconBackgroundView.backgroundColor = cell.backgroundColor

        if cellBadgeCount > 0 {
            badgeButton.setTitle(String(cellBadgeCount), for: .normal)
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

        if isCellToggle {
            accessoryView = UISwitch()
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

        if isCellToggle {
            accessoryView = .none
        }

        if cellBadgeCount > 0 {
            badgeButton.isHidden = true
        }
    }
}
